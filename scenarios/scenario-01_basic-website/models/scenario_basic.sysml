package SimpleWebServerScenario {

  // High-level system
  block ScenarioSystem {
    part backendServer: BackendServer
    part clients: Clients
    part webContent: WebContent
    part networkMonitor: NetworkMonitor
    part hostEnvironment: HostEnvironment
    reference versionControl: VersionControl
  }

  // Backend Server and substructure
  block BackendServer {
    part hostOS: UbuntuServer
    part container: DockerContainer
    part webServer: WebServer
    part content: WebContent
  }

  block UbuntuServer {}
  block DockerContainer {
    attribute configuredItems: String
  }
  block WebServer {
    attribute type: String // e.g., Nginx, Apache
    attribute configItems: String
  }

  // Clients
  block Clients {
    part browsers: BrowserClients
    part scripted: ScriptedClients
  }

  block BrowserClients {
    attribute configuration: String
  }
  block ScriptedClients {
    part scripts: ClientScripts
    attribute configuration: String
  }
  block ClientScripts {}

  // Web Content
  block WebContent {
    attribute type: String // e.g., HTML
  }

  // Network Monitor
  block NetworkMonitor {
    part monitorApp: MonitorApp
    part container: DockerContainer
    attribute configItems: String
  }
  block MonitorApp {}

  // Host Environment
  block HostEnvironment {
    part macOS: MacOSHost
    part winWSL: WindowsWSLHost
    part linux: UbuntuHost
  }
  block MacOSHost {}
  block WindowsWSLHost {}
  block UbuntuHost {}

  // Version Control (external reference)
  block VersionControl {
    part localRepo: LocalRepository
    part github: GitHubRepository
  }
  block LocalRepository {}
  block GitHubRepository {}

  // Actors
  block Administrator {}
  block ConfigurationManager {}
  block SystemEngineer {}
  block SiteDesigner {}
  block Tester {}
  block User {}
  block DataScientist {}

  // Interfaces (simplified as interfaceBlocks)
  interfaceBlock HTTP_Interface {}
  interfaceBlock Config_Interface {}
  interfaceBlock Monitor_Interface {}

  // Interface usages
  connect backendServer.webServer to clients via HTTP_Interface
  connect backendServer.webServer to webContent via Config_Interface
  connect networkMonitor to { backendServer, clients, hostEnvironment } via Monitor_Interface

  // Actor connections (informal – could be turned into UseCases later)
  connect Administrator to backendServer via Config_Interface
  connect Administrator to clients via Config_Interface
  connect SiteDesigner to webContent via Config_Interface
  connect {SystemEngineer, Tester, DataScientist} to {webContent, backendServer, clients, networkMonitor} via Config_Interface
}

