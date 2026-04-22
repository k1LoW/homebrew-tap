class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.4.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.0/mo_v1.4.0_darwin_arm64.zip'
      sha256 'e78a7376a8378b9b50303c3df850e456d2787be08d79b6a4e5f4946a91e1aad3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.0/mo_v1.4.0_darwin_amd64.zip'
      sha256 '0aba35cb97c56380666d2cc54cc5e3483801dbd69e3a12a505ee146691a1b8e9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.0/mo_v1.4.0_linux_arm64.tar.gz'
      sha256 '7ae4f4450f4a28db99b475e9b1d0de5a4b9f33b68a05865561431cde34b9326b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.0/mo_v1.4.0_linux_amd64.tar.gz'
      sha256 '293b2258f6e91532e12155acc60e1b0559452063ee0bc95ea475f017230a72e6'
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
