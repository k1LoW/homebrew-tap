class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.3'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.3/mo_v1.6.3_darwin_arm64.zip'
      sha256 '8f7faada9898f97264cd4bddb6e2dfcbca41b38c9e4ab73e4fe45a72cd8ab743'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.3/mo_v1.6.3_darwin_amd64.zip'
      sha256 '114f6e625d336dd8fce828c633e06bb5ece24625a74da30bbd4e0bc0078700b7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.3/mo_v1.6.3_linux_arm64.tar.gz'
      sha256 '2dffcbd871b44ec524216f35551d6c12ecc793d6a6a15e8c4ffd8ab09d45e34c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.3/mo_v1.6.3_linux_amd64.tar.gz'
      sha256 'b286ea74149e2c8f73cdb8e38a82bd6223a786962801bde9ab6a7509c25c8df0'
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
