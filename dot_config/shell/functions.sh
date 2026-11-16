# Functions for bash and zsh: sourced by ~/.bashrc and ~/.zshrc.
# Only syntax both shells share.

unpack() {
    local remove=0
    local opt
    OPTIND=1
    while getopts ":rh" opt; do
        case "$opt" in
            r) remove=1 ;;
            h)
                printf 'Usage: unpack [-r] <archive> [destination_dir]\n'
                printf 'Options:\n  -r    Remove archive after successful extraction\n  -h    Show help\n'
                return 0
                ;;
            \?) printf 'unpack: invalid option: -%s\n' "$OPTARG" >&2; return 1 ;;
        esac
    done
    shift $((OPTIND - 1))

    local archive="$1"
    local dest="${2:-.}"

    if [ -z "$archive" ]; then
        printf 'Usage: unpack [-r] <archive> [destination_dir]\n' >&2
        return 1
    fi

    if [ ! -f "$archive" ]; then
        printf 'unpack: file not found: %s\n' "$archive" >&2
        return 1
    fi

    local base="${archive##*/}"
    base="${base%.tar.*}"
    base="${base%.tgz}"
    base="${base%.tbz2}"
    base="${base%.txz}"
    base="${base%.*}"

    local entries=""
    case "$archive" in
        *.tar|*.tar.gz|*.tgz|*.tar.bz2|*.tbz2|*.tar.xz|*.txz|*.tar.zst)
            if ! command -v tar >/dev/null 2>&1; then
                printf 'unpack: error: tar is required to extract %s\n' "$archive" >&2
                return 1
            fi
            entries=$(tar -tf "$archive" 2>/dev/null)
            ;;
        *.zip)
            if command -v unzip >/dev/null 2>&1; then
                entries=$(unzip -Z1 "$archive" 2>/dev/null)
            elif command -v 7zz >/dev/null 2>&1; then
                entries=$(7zz l -ba -slt "$archive" 2>/dev/null | sed -n 's/^Path = //p')
            elif command -v ouch >/dev/null 2>&1; then
                entries=$(ouch list "$archive" 2>/dev/null)
            else
                printf 'unpack: error: unzip, 7zz, or ouch is required to extract %s\n' "$archive" >&2
                return 1
            fi
            ;;
        *.7z)
            if command -v 7zz >/dev/null 2>&1; then
                entries=$(7zz l -ba -slt "$archive" 2>/dev/null | sed -n 's/^Path = //p')
            elif command -v 7z >/dev/null 2>&1; then
                entries=$(7z l -ba -slt "$archive" 2>/dev/null | sed -n 's/^Path = //p')
            elif command -v ouch >/dev/null 2>&1; then
                entries=$(ouch list "$archive" 2>/dev/null)
            else
                printf 'unpack: error: 7zz, 7z, or ouch is required to extract %s\n' "$archive" >&2
                return 1
            fi
            ;;
        *.rar)
            if command -v unrar >/dev/null 2>&1; then
                entries=$(unrar lb "$archive" 2>/dev/null)
            elif command -v 7zz >/dev/null 2>&1; then
                entries=$(7zz l -ba -slt "$archive" 2>/dev/null | sed -n 's/^Path = //p')
            elif command -v unar >/dev/null 2>&1; then
                entries=$(lsar "$archive" 2>/dev/null)
            elif command -v ouch >/dev/null 2>&1; then
                entries=$(ouch list "$archive" 2>/dev/null)
            else
                printf 'unpack: error: unrar, 7zz, unar, or ouch is required to extract %s\n' "$archive" >&2
                return 1
            fi
            ;;
        *)
            if command -v 7zz >/dev/null 2>&1; then
                entries=$(7zz l -ba -slt "$archive" 2>/dev/null | sed -n 's/^Path = //p')
            elif command -v ouch >/dev/null 2>&1; then
                entries=$(ouch list "$archive" 2>/dev/null)
            else
                printf 'unpack: error: unsupported archive format or missing extractor for %s\n' "$archive" >&2
                return 1
            fi
            ;;
    esac

    local file_count
    file_count=$(printf '%s\n' "$entries" | grep -v -E '[/\\]$' | grep -v '^$' | wc -l)

    local target="$dest"
    if [ "$file_count" -gt 2 ]; then
        local root_count
        root_count=$(printf '%s\n' "$entries" | sed 's#^\./##; s#[/\\].*##' | grep -v '^$' | sort -u | wc -l)
        local has_children
        has_children=$(printf '%s\n' "$entries" | grep -m1 '[/\\]')

        if [ "$root_count" -ne 1 ] || [ -z "$has_children" ]; then
            target="${dest%/}/$base"
        fi
    fi

    mkdir -p "$target" || return 1

    local status=0
    case "$archive" in
        *.tar|*.tar.gz|*.tgz|*.tar.bz2|*.tbz2|*.tar.xz|*.txz|*.tar.zst)
            tar -xf "$archive" -C "$target" || status=$?
            ;;
        *.zip)
            if command -v unzip >/dev/null 2>&1; then
                unzip -q "$archive" -d "$target" || status=$?
            elif command -v 7zz >/dev/null 2>&1; then
                7zz x -bso0 -bsp0 -y "$archive" -o"$target" || status=$?
            else
                ouch decompress -y "$archive" --dir "$target" || status=$?
            fi
            ;;
        *.7z)
            if command -v 7zz >/dev/null 2>&1; then
                7zz x -bso0 -bsp0 -y "$archive" -o"$target" || status=$?
            elif command -v 7z >/dev/null 2>&1; then
                7z x -bso0 -bsp0 -y "$archive" -o"$target" || status=$?
            else
                ouch decompress -y "$archive" --dir "$target" || status=$?
            fi
            ;;
        *.rar)
            if command -v unrar >/dev/null 2>&1; then
                unrar x -inul -y "$archive" "$target/" || status=$?
            elif command -v 7zz >/dev/null 2>&1; then
                7zz x -bso0 -bsp0 -y "$archive" -o"$target" || status=$?
            elif command -v unar >/dev/null 2>&1; then
                unar -o "$target" "$archive" || status=$?
            else
                ouch decompress -y "$archive" --dir "$target" || status=$?
            fi
            ;;
        *)
            if command -v 7zz >/dev/null 2>&1; then
                7zz x -bso0 -bsp0 -y "$archive" -o"$target" || status=$?
            else
                ouch decompress -y "$archive" --dir "$target" || status=$?
            fi
            ;;
    esac

    if [ "$status" -eq 0 ]; then
        if [ "$remove" -eq 1 ]; then
            rm -f "$archive"
            printf 'Extracted and removed %s\n' "$archive"
        fi
        return 0
    else
        printf 'unpack: extraction failed for %s (exit code %d)\n' "$archive" "$status" >&2
        return "$status"
    fi
}

rdp() {
    if ! command -v wlfreerdp >/dev/null 2>&1; then
        printf 'rdp: wlfreerdp command not found in PATH\n' >&2
        return 127
    fi

    if [ $# -eq 0 ]; then
        printf 'Usage: rdp <host[:port]> [username] [extra_args...]\n' >&2
        return 1
    fi

    case "$1" in
        /*|-*)
            command wlfreerdp "$@"
            return $?
            ;;
    esac

    local host="$1"
    local user="${2:-$USER}"

    if [ $# -ge 2 ]; then
        shift 2
    else
        shift 1
    fi

    command wlfreerdp \
        /v:"$host" \
        /u:"$user" \
        /dynamic-resolution \
        +clipboard \
        /sound:sys:pulse \
        /network:auto \
        +auto-reconnect \
        "$@"
}

