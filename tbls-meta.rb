class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.8'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.8/tbls-meta_v0.4.8_darwin_arm64.zip'
      sha256 'd5eab7977d0875d94ccef89c989d613bea0d46e01bb9626dec49d7d40935eb47'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.8/tbls-meta_v0.4.8_darwin_amd64.zip'
      sha256 '681913dc0f71cfdeef445af856bc2f89e78642a5714a74a0ec14da67ee9a1f9d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.8/tbls-meta_v0.4.8_linux_arm64.tar.gz'
      sha256 '80596aa173041744b91d2af1cc3c9c53dcbd53dffe174eb4e0ebd056b3a615b3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.8/tbls-meta_v0.4.8_linux_amd64.tar.gz'
      sha256 'd50847b28c139a1e2280ce13f9197b99bed4768433b414b464b9012d09af4be9'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-meta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-meta'
    generate_completions_from_executable(bin/'tbls-meta', 'completion')
  end
end
