# Home Assistant Community Add-on: MollySocket

[MollySocket][mollysocket] lets you get Signal notifications on Molly Android via [UnifiedPush][unifiedpush]. It connects to the Signal server as a linked device **without holding any encryption key**, and forwards notification triggers to your phone through a UnifiedPush distributor.

This add-on packages the [MollySocket][mollysocket] server for Home Assistant, including an automatic VAPID key setup and a persistent database in `/data`.

## Installation

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Feasrng%2Fha-addons%2F)

Or add the repository manually: `https://github.com/easrng/ha-addons/`, then install the **MollySocket** add-on.

## Usage

1. Install a [UnifiedPush distributor][distributors] on your phone (easiest is [ntfy](https://f-droid.org/en/packages/io.heckel.ntfy/)).
2. Point Molly to your distributor.
3. Open `http://<your-home-assistant>:8020` and scan the QR code from Molly: **Settings > Notifications** → delivery method **UnifiedPush** → *MollySocket server*.
4. If Molly can't reach the server over HTTPS, put a reverse proxy (e.g. nginx or HA's own proxy) in front of port `8020`, see the [Troubleshoot section][ts] of the upstream README.

## Support

Create an [issue on GitHub][issues].

[mollysocket]: https://github.com/mollyim/mollysocket
[unifiedpush]: https://unifiedpush.org/
[distributors]: https://unifiedpush.org/users/distributors/
[ts]: https://github.com/mollyim/mollysocket#troubleshoot
[issues]: https://github.com/easrng/ha-addons/issues