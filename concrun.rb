class Concrun < Formula
  desc 'Run commands concurrently'
  version '0.3.2'
  homepage 'https://github.com/k1LoW/concrun'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.2/concrun_v0.3.2_darwin_arm64.zip'
      sha256 'b434b810c54a7c9e44d8be29eb0facb2a2d7a195c05515ab520f1923d27377c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.2/concrun_v0.3.2_darwin_amd64.zip'
      sha256 '9bd5530e084bcab65e9a0066d3361f7c4d0ad84a36587cd7bd2a898f40b55258'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.2/concrun_v0.3.2_linux_arm64.tar.gz'
      sha256 'a7375cf6a386637ae0463bedd0f08baa4c3e692fb881df0a4e7102760f3ce890'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.2/concrun_v0.3.2_linux_amd64.tar.gz'
      sha256 'b3219f60b6b59afbc7f88e9fed843851ce424d5f20e8d53cc8562464bed3c87b'
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
