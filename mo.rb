class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.1/mo_v1.6.1_darwin_arm64.zip'
      sha256 '83177941725c9044d1415472abbf5d51b57344c0645363c8c6e7ccc3dcec0e71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.1/mo_v1.6.1_darwin_amd64.zip'
      sha256 'af59649e3995ad6d6253a5857d4658774cb5b882645f2b7de5a8ed4b2878eb28'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.1/mo_v1.6.1_linux_arm64.tar.gz'
      sha256 'ff3dc070f15a42eaf26da92383d77cfb27d35f78c244f886ef1ae21375cefcdb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.1/mo_v1.6.1_linux_amd64.tar.gz'
      sha256 'af0c4f327a11d50c2841639b3136e2a6c982493267b9c82b27df393f60dbc961'
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
