# Homebrew formula for inspector_claude.
#
# Ships the prebuilt macOS binaries attached to the GitHub Release, so no Go
# toolchain is needed at install time. The sha256 values below must match the
# assets of the release named in VERSION; see RELEASING.md in this repo.
class InspectorClaude < Formula
  desc "Terminal browser and full-text search for Claude Code transcripts"
  homepage "https://github.com/danielfrey/inspector_claude"
  version "0.1.0"
  license "MIT"

  # Only macOS binaries are published for now; Linux users get a clear error
  # instead of a confusing download failure.
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/danielfrey/inspector_claude/releases/download/v0.1.0/inspector_claude-darwin-arm64"
      sha256 "7f42cf0cd49db585f85f6131853301580c34cba281f0cfd5ded65f706711790c"

      def install
        bin.install "inspector_claude-darwin-arm64" => "inspector_claude"
      end
    end

    on_intel do
      url "https://github.com/danielfrey/inspector_claude/releases/download/v0.1.0/inspector_claude-darwin-amd64"
      sha256 "d45c814b53f3b0b15d6a3a3ea2f810ec4c30d20ec8032a781757cdb33c5be7f4"

      def install
        bin.install "inspector_claude-darwin-amd64" => "inspector_claude"
      end
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inspector_claude --version")
  end
end
