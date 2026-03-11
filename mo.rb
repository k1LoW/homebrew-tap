class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.18.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.2/mo_v0.18.2_darwin_arm64.zip'
      sha256 '93d0c25d9bc86dd739b4c1ac721ce524e0d9c8a9c3dcfd2e35eb5ed0c39cf645'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.2/mo_v0.18.2_darwin_amd64.zip'
      sha256 '411113b7704e8e61a6ee3e109d6179da90759a9d4579c8f7323f2f7815c364cc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.2/mo_v0.18.2_linux_arm64.tar.gz'
      sha256 'f4c64b355b32b3508f9dbe6081ca4ce3ca6abd11d94f1e5e13e886164dde6d7d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.2/mo_v0.18.2_linux_amd64.tar.gz'
      sha256 '72e26e5640a1588bf1b0676a04defccba3393a4652106dccd3f83b927c893648'
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
