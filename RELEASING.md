# Releasing a new version

The build is automated; only the checksums in the formula are manual.

1. **Tag the tool's repo** (in `inspector_claude`, not here):

   ```sh
   git tag -a v0.2.0 -m "Release v0.2.0"
   git push github v0.2.0
   ```

   The `release` workflow builds `darwin/amd64` + `darwin/arm64` on a macOS
   runner and attaches them, plus a `SHA256SUMS` file, to a GitHub Release.

2. **Read the checksums** once the workflow is green:

   ```sh
   curl -sL https://github.com/danielfrey/inspector_claude/releases/download/v0.2.0/SHA256SUMS
   ```

3. **Update `Formula/inspector_claude.rb`**: bump `version`, both `url`s and
   both `sha256`s, then commit and push this repo.

4. **Verify**:

   ```sh
   brew update
   brew upgrade inspector_claude
   inspector_claude --version
   ```

## Automating step 2+3

A job in the tool's release workflow can write and push the formula itself.
It needs a Personal Access Token with `contents: write` on *this* repo, stored
as a secret in the tool's repo — the workflow's built-in `GITHUB_TOKEN` only
has access to its own repository.
