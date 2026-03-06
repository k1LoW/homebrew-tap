class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.14.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.0/mo_v0.14.0_darwin_arm64.zip'
      sha256 '9fe085d90ca70cf59afb5ab847293e1c122702dbc8370262c1e3260a8c37b6eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.0/mo_v0.14.0_darwin_amd64.zip'
      sha256 'd4c2682980cb69bfb89ab931514a72a26a487213bc6dc268c5fe1a5994708227'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.0/mo_v0.14.0_linux_arm64.tar.gz'
      sha256 'dccb782be4c5f3a8b0f1ac02f25232c45d3979cde0d69f6192435609cca7e25e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.0/mo_v0.14.0_linux_amd64.tar.gz'
      sha256 'e33b70c87df2fd83c699a2ab2f8f48e67a268de743d7ac7fe43ca7454507814d'
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
