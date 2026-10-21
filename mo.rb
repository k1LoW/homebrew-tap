class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.7.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.7.0/mo_v1.7.0_darwin_arm64.zip'
      sha256 '0787226aa3ff99cc85c483f512c29afd889359276ca10841b3a147c9969b3746'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.7.0/mo_v1.7.0_darwin_amd64.zip'
      sha256 '0ccd6f81bab98b1e385e913a9c1ec86cad02747fce293f4ad4df1e7f9601eca8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.7.0/mo_v1.7.0_linux_arm64.tar.gz'
      sha256 'fd7cb2e267987e09c49e04f29322e3413aae18440edca0a2ba0a662f9773d772'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.7.0/mo_v1.7.0_linux_amd64.tar.gz'
      sha256 '6760e48a24a406915d396ba1d13dd7d5650eea52156f40a8cd075da14b864ab3'
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
