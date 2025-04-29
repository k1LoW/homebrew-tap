class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.85.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.2/tbls_v1.85.2_darwin_arm64.zip'
      sha256 '95b1d321eb8f564134c5bb6b5a72da45d9d75a6f4ee580b109a2be5b5f7ed871'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.2/tbls_v1.85.2_darwin_amd64.zip'
      sha256 '4c36f1808f177edb840d1ad6168d4b9927be1d1311630da3beb6966779fdce87'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.2/tbls_v1.85.2_linux_arm64.tar.gz'
      sha256 '75e86264f20170e576fc9b10a51f0cf615cebbb20a5b3c374361814950f796b9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.2/tbls_v1.85.2_linux_amd64.tar.gz'
      sha256 'a051c083243f6ef90d18cc6a01013169984a779b7ecc42a112a40c7701ae8b42'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system './tbls', 'completion', 'bash', '--out', 'tbls.bash'
    system './tbls', 'completion', 'zsh', '--out', 'tbls.zsh'
    bin.install 'tbls'
    bash_completion.install 'tbls.bash' => 'tbls'
    zsh_completion.install 'tbls.zsh' => '_tbls'
  end
end
