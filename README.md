# BlueBuilds &nbsp; [![bluebuild build badge](https://github.com/sj-ferdinand/BlueBuilds/actions/workflows/build.yml/badge.svg)](https://github.com/sj-ferdinand/BlueBuilds/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for information.


These images are built on BlueBuild's Fedora Kinoite base, with a bunch of modifications including:
- extra DNF packages for codecs and utilities
- flatpaks declared to be installed (with no user effort needed)
- my own custom plymouth theme
- extended initramfs to add resume (from hibernate) support
- custom builds per-device for drivers, video acceleration and other boring but useful things

> [!IMPORTANT]
> These images are **heavily** customised down to each device's drivers and my own use cases for them.
> I would honestly not recommend pulling and using them yourself, these are exclusively for my own use and so probably won't be suitable for anyone else.
>
> With that said, it's pretty much all just .yml files so feel free to make your own builds based on these with your own changes.

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

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/unnamed-programmer/kinoite-custom-base
```
