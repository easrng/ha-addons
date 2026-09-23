# MollySocket add-on

## Description

This add-on runs [MollySocket][mollysocket], a service that forwards Signal notifications to [Molly Android][molly] via [UnifiedPush][unifiedpush]. It acts as a Signal linked device without holding any encryption key and notifies your phone whenever a new message arrives.

The add-on stores everything it needs inside the persistent `/data` directory:

- `mollysocket.db` – the SQLite database with the credentials of the linked device
- `mollysocket.toml` – the generated configuration file
- `vapid_key` – the VAPID private key (auto-generated on first start)

## Installation

1. Add this repository to your Home Assistant add-on store:

   `https://github.com/easrng/ha-addons`

2. Install the **MollySocket** add-on.
3. Start the add-on.

## Usage

1. Install a [UnifiedPush distributor][distributors] on your phone (easiest is [ntfy][ntfy]).
2. In Molly, go to **Settings > Notifications** and set the delivery method to *UnifiedPush*.
3. Open `http://<your-home-assistant-host>:8020` in your browser and scan the QR code with Molly.
4. Optionally, put a reverse proxy in front of port `8020` so Molly can reach the server over HTTPS. See the [upstream troubleshoot guide][ts] if you see origin/pathname warnings.

## Configuration

### Option: `host`

Listening address of the web server. Defaults to `0.0.0.0`.

### Option: `port`

Listening port of the web server. Defaults to `8020`.

### Option: `allowed_endpoints`

List of UnifiedPush servers that MollySocket may use to push notifications. Defaults to `["*"]`.

> **Note:** If you self-host your push server, add it explicitly (scheme, domain and port), e.g. `["https://push.mydomain.tld"]`. Endpoints on your local network must be allowed explicitly.

### Option: `allowed_uuids`

UUIDs of Signal accounts that are allowed to use this server. Defaults to `["*"]`. You can restrict it to your account, which is shown in Molly under **Settings > Notifications > UnifiedPush**.

### Option: `vapid_privkey` (optional)

Your VAPID private key. If left empty, one is generated automatically on first start and persisted to `/data/vapid_key`. Setting it lets you move the key between instances or use a key you generated yourself.

> A VAPID key is required to display the QR code on the web page.

## URLs

- [MollySocket](https://github.com/mollyim/mollysocket)
- [Molly](https://github.com/mollyim/mollyandroid)
- [UnifiedPush](https://unifiedpush.org/)

[mollysocket]: https://github.com/mollyim/mollysocket
[molly]: https://github.com/mollyim/mollyandroid
[unifiedpush]: https://unifiedpush.org/
[distributors]: https://unifiedpush.org/users/distributors/
[ntfy]: https://f-droid.org/en/packages/io.heckel.ntfy/
[ts]: https://github.com/mollyim/mollysocket#troubleshoot