class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.7'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.7/mo_v1.6.7_darwin_arm64.zip'
      sha256 '83c0efa272b3044c8189f6ffb74bc6ecb20e3d9299eed476e63ee72d149643f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.7/mo_v1.6.7_darwin_amd64.zip'
      sha256 '376cb36b3e3b4e0075fa7f0b37685d9df9b56d4bd80e2d99596ab8e5a46932f6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.7/mo_v1.6.7_linux_arm64.tar.gz'
      sha256 '90b3fc49d38d73d5acc9b1ac6d1a992ffba5bf4d12787c2e645411af2993b8ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.7/mo_v1.6.7_linux_amd64.tar.gz'
      sha256 '130666a7c8dfd1528d07f87b21adf5bfc1314707889e85ebbab1a5248d7ded11'
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
