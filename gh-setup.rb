class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.5.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.5.0/gh-setup_v1.5.0_darwin_arm64.zip'
      sha256 'ee6fc01dfcc52572842a7b6d7a021c2b4f873eb00d7ab9f4f89443c6cdc2181b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.5.0/gh-setup_v1.5.0_darwin_amd64.zip'
      sha256 '6ff6b20f99c7b37f5ca4f8a335a04fcd04909e3a2ec60c54c19118b0b4806861'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.5.0/gh-setup_v1.5.0_linux_amd64.tar.gz'
      sha256 '94cbe9cbad4f0a4f50508dace911937555654c4a34c227e816d560a594117139'
    end
  end

  head do
    url 'https://github.com/k1LoW/gh-setup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-setup'
  end
end
