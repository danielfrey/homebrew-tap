# danielfrey/homebrew-tap

Homebrew formulae for my command-line tools.

```sh
brew tap danielfrey/tap
brew trust danielfrey/tap          # Homebrew 7+ requires this for third-party taps
brew install inspector_claude
```

If you would rather not trust the whole tap (which also covers formulae added
here later), trust just the one formula:

```sh
brew trust --formula danielfrey/tap/inspector_claude
```

## Formulae

| Formula | Description |
|---------|-------------|
| [`inspector_claude`](Formula/inspector_claude.rb) | Terminal browser and full-text search for [Claude Code](https://claude.com/claude-code) session transcripts |

Only macOS binaries are published; the formula refuses to install elsewhere.
