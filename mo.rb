class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.8.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.2/mo_v1.8.2_darwin_arm64.zip'
      sha256 '4c2968a9ab02f3687ea81961085c106f232a2c63ba5088ec819b3955a1424c5e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.2/mo_v1.8.2_darwin_amd64.zip'
      sha256 'd833f1e5450a8e5cce383c371c1b9b268baddd2cdc0ca32cb6eb765d0272e0b3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.2/mo_v1.8.2_linux_arm64.tar.gz'
      sha256 '49eef17ba90bf8cbd8ed65c36955d5a7f5572b372bbf0ee1a3f51e2fbec34781'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.2/mo_v1.8.2_linux_amd64.tar.gz'
      sha256 '3b8a35b89c41df05a5769b3b7fb13e3ffef358c5e990e89520487218a268fcf1'
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
