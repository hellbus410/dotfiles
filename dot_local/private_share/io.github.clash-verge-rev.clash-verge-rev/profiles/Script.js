// Define main function (script entry)

// DNS is replaced whole rather than merged, so a profile's own nameservers and policies are dropped.
// mihomo asks AdGuard Home on 127.0.0.1 and opens no port of its own; real IPs, as AdGuard Home has already answered the apps.
// TLS-based nodes without a client-fingerprint use Go's own TLS handshake, which no browser sends; mimic Chrome's instead.
// Proxy is the one group the rules in Merge.yaml send traffic to: pick any of the subscription's groups, or any single node, in it.
function main(config, profileName) {
  config.dns = {
    enable: true,
    ipv6: config.ipv6 ?? false,
    "enhanced-mode": "redir-host",
    "default-nameserver": ["127.0.0.1"],
    nameserver: ["127.0.0.1"],
    "proxy-server-nameserver": ["127.0.0.1"],
  };
  for (const proxy of config.proxies ?? []) {
    if (["anytls", "trojan"].includes(proxy.type) && !proxy["client-fingerprint"]) {
      proxy["client-fingerprint"] = "chrome";
    }
  }
  const groups = config["proxy-groups"] ?? [];
  groups.unshift({
    name: "Proxy",
    type: "select",
    proxies: groups.map((group) => group.name),
    "include-all-proxies": true,
  });
  config["proxy-groups"] = groups;
  return config;
}
