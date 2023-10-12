class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.3.2'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.2/tbls-meta_v0.3.2_darwin_arm64.zip'
      sha256 '1237bbdf92faf953b1b43f6029b8bfa68b2ed23f408661dda7dd3267179c80da'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.2/tbls-meta_v0.3.2_darwin_amd64.zip'
      sha256 'aeb084d0c58e8a5d04c8ce81a46633e3321a352b4c2405ce5c0438230e5d070a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.2/tbls-meta_v0.3.2_linux_arm64.tar.gz'
      sha256 'f0ee829e645ff3ee436d2fee38b2db82d0125f8505f24ba2d59be86e63432296'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.2/tbls-meta_v0.3.2_linux_amd64.tar.gz'
      sha256 'c2dc4482282383ce23201db9a77de5f01b779bb5ca61228805e68f0cc81fb780'
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
