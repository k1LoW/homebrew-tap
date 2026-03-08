class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.16.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.0/mo_v0.16.0_darwin_arm64.zip'
      sha256 'ff0171ec8fe6d4e48bca78be66eb00793fb91fd107e5710047f12d93a42cb3ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.0/mo_v0.16.0_darwin_amd64.zip'
      sha256 '7e05bf47c7e77ec3f9df9dd96ffb019c52c2ef4b6ff34165d8eea0d2b0cde738'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.0/mo_v0.16.0_linux_arm64.tar.gz'
      sha256 '164f68bf7a9fd05db7f412eff63172f5a04e928bcf96d04231a468bb2ecadc62'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.0/mo_v0.16.0_linux_amd64.tar.gz'
      sha256 '27ea6bbe8a534fe4456f233da966f40e569b4b4b8c2b15fcc2c3a467c049a0eb'
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
