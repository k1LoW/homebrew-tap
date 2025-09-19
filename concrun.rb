class Concrun < Formula
  desc 'Run commands concurrently'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/concrun'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.1.1/concrun_v0.1.1_darwin_arm64.zip'
      sha256 'fe6882444024fd2fd334b8751bdc716f02e2cba519b005d3e1e2948ea41c9876'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.1.1/concrun_v0.1.1_darwin_amd64.zip'
      sha256 '9e9cb8792406dae434c716c571339e36df8180dde59c28e8dfb8bf1e960f6e16'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.1.1/concrun_v0.1.1_linux_arm64.tar.gz'
      sha256 'e28604fbfb97e423c3922125c7df5fc0b5b5c20424ea2876d579f6467d926abb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.1.1/concrun_v0.1.1_linux_amd64.tar.gz'
      sha256 '36b85a1a68381ea50d9dca982f134effd1fef13b2d08b609c83ca8d557e6189c'
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
