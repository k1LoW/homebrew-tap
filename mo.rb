class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.5.4'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.4/mo_v1.5.4_darwin_arm64.zip'
      sha256 'ce0188ad49cf6dcd98498471b7c3a307bb7388cb0f59ba9913dc2468530c9004'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.4/mo_v1.5.4_darwin_amd64.zip'
      sha256 'ae251c56434e1b4544e68cbf1dc3f28c003bcf07cfb5cc964fa52a5b89921d8f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.4/mo_v1.5.4_linux_arm64.tar.gz'
      sha256 'c49ad190250ad8788e2dfeb78daa37e8d00df9915971dfd8a628acdfe02f34c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.4/mo_v1.5.4_linux_amd64.tar.gz'
      sha256 '4a5d17a7e1208916d2e57af920bf7c90c77b60d24f42687336e68d9a5b97bae4'
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
