class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.1/coglet_v0.4.1_darwin_arm64.zip'
      sha256 '4e214e7b4071736134247bf79585b932b82cfc9494e76be94c65d46cac7e546f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.1/coglet_v0.4.1_darwin_amd64.zip'
      sha256 '34c43e3d56f30f19d36c7817ff5a01d13d3a7467617a251faf50b6b4c1d63d62'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.1/coglet_v0.4.1_linux_arm64.tar.gz'
      sha256 '5089502022ea0bbb6478cf74a57a07199a77178815f4f927dcadc945288eefef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.1/coglet_v0.4.1_linux_amd64.tar.gz'
      sha256 'b2b0356bebfc243e3ebc60450489e26d54644ed9da0a1fc16ac4aaa0d4d45371'
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
