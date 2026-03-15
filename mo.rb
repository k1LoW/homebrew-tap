class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.18.4'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.4/mo_v0.18.4_darwin_arm64.zip'
      sha256 '10de7fa3b434f443a30295cffc0dc3871250c8bd01a4de0bdd110381ce318e20'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.4/mo_v0.18.4_darwin_amd64.zip'
      sha256 'a05fcf015cee693b5b4e4c254a99d1e43c4afb165b9d4256ebbb7a3903d6919a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.4/mo_v0.18.4_linux_arm64.tar.gz'
      sha256 '362ac54cbcd70b55d11e673766a26b38d7cd7767eb5ce9a7b224803f1134c046'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.4/mo_v0.18.4_linux_amd64.tar.gz'
      sha256 '939a4a456317152772e6217fa0dd082b94499398c1981fea0bd2291940c66a75'
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
