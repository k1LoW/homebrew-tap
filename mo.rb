class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.20.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.0/mo_v0.20.0_darwin_arm64.zip'
      sha256 'dc616163ca126b0519e741edbfe94c2aca8d43e7efff817bc52ef6bf3cd78c47'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.0/mo_v0.20.0_darwin_amd64.zip'
      sha256 '6f5c673b5fcf2d60706bd92338793f9b09d791e671fdc0341104512ffb450d75'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.0/mo_v0.20.0_linux_arm64.tar.gz'
      sha256 '0ae193862ded114edc893ebcf154dbb781a96641a011b0403eaf2bc4c3edf5f2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.0/mo_v0.20.0_linux_amd64.tar.gz'
      sha256 'e5cdd58938a3ba3d0054dd48b70793fdef4048229ffafa1190ea683c7ff29c81'
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
