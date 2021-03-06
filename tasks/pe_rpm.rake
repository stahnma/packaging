if @build_pe
  namespace :pe do
    desc "Build a PE rpm using rpmbuild (requires all BuildRequires, rpmbuild, etc)"
    task :local_rpm => "package:rpm"

    desc "Build rpms using ALL final mocks in build_defaults yaml, keyed to PL infrastructure, pass MOCK to override"
    task :local_mock_final => "pl:mock_final"

    desc "Build a PE rpm using the default mock"
    task :local_mock => "pl:mock"
  end
end

