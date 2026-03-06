# BlueBuilds &nbsp; [![bluebuild build badge](https://github.com/sj-ferdinand/BlueBuilds/actions/workflows/build.yml/badge.svg)](https://github.com/sj-ferdinand/BlueBuilds/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for information.


These images are built on BlueBuild's Fedora Kinoite base, with a bunch of modifications including:
- extra DNF packages for codecs and utilities
- flatpaks to be automatically installed at boot (with no user action needed)
- my own custom plymouth theme
- added `resume` to dracut/initramfs config to enable hibernation (still needs user action after install to set up though)
- custom builds for specific devices covering hardware acceleration, drivers and other boring things

> [!IMPORTANT]
> These images are **heavily** customised down to each device's drivers and my own use cases for them.
> I would honestly not recommend pulling and using them yourself, these are exclusively for my own use and so probably won't be suitable for anyone else.
>
> With that said, it's pretty much all just .yml files so it's not hard to take this and modify it to your own liking instead.

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed (where (image) is which device build you want to use):
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/sj-ferdinand/kinoite-(image):latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/sj-ferdinand/kinoite-(image):latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version (except I've set the source tag to `latest` too so you will.)

## ISO

You can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). Due to their size, these can't be hosted on Github so you'll need to generate one locally.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/sj-ferdinand/kinoite-(image)
```
