class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.0/coglet_v0.1.0_darwin_arm64.zip'
      sha256 'f72cc65e6dd27d612724150d9cf45becd1612c6c8b9167b9e7033b0136f480f6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.0/coglet_v0.1.0_darwin_amd64.zip'
      sha256 'bf6e42c5242527e84bb4602de83a9514bf9d4b243c3749483bea2e953d1ded46'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.0/coglet_v0.1.0_linux_arm64.tar.gz'
      sha256 '65ace2cbd1d5864ff4063bb85811faf5104ee849f42aaed1478b8a242cbf5b27'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.0/coglet_v0.1.0_linux_amd64.tar.gz'
      sha256 'a6d9bc018e8c1f8aa3a273865fd83180e8102b4609b7609d33179b77e548b6d2'
    end
  end

  head do
    url 'https://github.com/k1LoW/coglet.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'coglet'
  end
end
