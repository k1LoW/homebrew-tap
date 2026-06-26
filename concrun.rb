class Concrun < Formula
  desc 'Run commands concurrently'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/concrun'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.1/concrun_v0.3.1_darwin_arm64.zip'
      sha256 '9244d21b66d3a29850de6b1f10d75ee83be47d3374c1072a3ce0062d25915223'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.1/concrun_v0.3.1_darwin_amd64.zip'
      sha256 '281da38f64af9dd317f3c50ace656382efa5638ef888fb5f382ec2736eed32f6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.1/concrun_v0.3.1_linux_arm64.tar.gz'
      sha256 'b4832463f6177096883a47ae6c01592944a6088e78d1247adf2fb4aae1a8f1ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.1/concrun_v0.3.1_linux_amd64.tar.gz'
      sha256 '4fefb98aa10879bb5a2a6888aeb351d9c2f0bc6499c0fab4a0a0fe4441c1a4f9'
    end
  end

  head do
    url 'https://github.com/k1LoW/concrun.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'concrun'
  end
end
