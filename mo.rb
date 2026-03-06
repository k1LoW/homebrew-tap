class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.15.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.1/mo_v0.15.1_darwin_arm64.zip'
      sha256 '0b3eaa669a5439c3da46f0b8c68dd4e4c6d81a15976589a622bdc0ac0c204bdb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.1/mo_v0.15.1_darwin_amd64.zip'
      sha256 'f951054eb78854a9b0590260a8918d7bad6066d36d9f0b5ee4bef9cd7cd3aefa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.1/mo_v0.15.1_linux_arm64.tar.gz'
      sha256 '7b8687b27979dca06d3e764a82eb6f70c367b169471916258fcb886ba68b0596'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.1/mo_v0.15.1_linux_amd64.tar.gz'
      sha256 '7c7e80a860145d3f03a017a99f30f6f191e62de44a8d259f20ebc437c27f69aa'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
    generate_completions_from_executable(bin/'mo', 'completion')
  end
end
