class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.18.5'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.5/mo_v0.18.5_darwin_arm64.zip'
      sha256 'e0c6480a4cb1efa4c5e2ad9bce0a0955c2d66a421b78068f43248d15889c1674'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.5/mo_v0.18.5_darwin_amd64.zip'
      sha256 'b36037c96721aeac67fa4e5bb08c431e0df6ba085a9a199246af5ad0a4096fa7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.5/mo_v0.18.5_linux_arm64.tar.gz'
      sha256 '3c75a50cbed696567161a9f9f6006ab5220638ac9a2adcd8ffb398a088d3fc00'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.5/mo_v0.18.5_linux_amd64.tar.gz'
      sha256 '949fec758c567972a3674c1b6144f7a7c1faa9e215d8df60c0925ebe970b9652'
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
