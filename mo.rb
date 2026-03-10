class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.16.3'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.3/mo_v0.16.3_darwin_arm64.zip'
      sha256 '852def3fb83ebd1a57d871bd92d57a3388786341d19d061663bfbd032cf92e9c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.3/mo_v0.16.3_darwin_amd64.zip'
      sha256 '51eb0351a2a2c38e2ef3db576aff1c0a7343979aed66e484e7c8186c7dfe04a3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.3/mo_v0.16.3_linux_arm64.tar.gz'
      sha256 '24c38515c6274924c21782b05ccbee014f50c8781d8e82aa718235eb63888626'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.3/mo_v0.16.3_linux_amd64.tar.gz'
      sha256 '4bb2b171b42a08b1bf6c03f342c2ae4c51953bdd5827f6b4e798f537e02116a0'
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
