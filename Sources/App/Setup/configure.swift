
import Vapor
import FluentPostgreSQL
import Authentication
/// Called before your application initializes.
///
/// https://docs.vapor.codes/3.0/getting-started/structure/#configureswift
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    try services.register(FluentPostgreSQLProvider())
    try services.register(AuthenticationProvider())


    let serverConfig = NIOServerConfig.default(hostname: "0.0.0.0",
                                               port: 8988)
    services.register(serverConfig)
    /// 配置全局的 middleware

    var middlewaresConfig = MiddlewareConfig()
    try middlewares(config: &middlewaresConfig)
    services.register(middlewaresConfig)

    var commandConfig = CommandConfig.default()
    commands(config: &commandConfig)
    services.register(commandConfig)

    /// Register Content Config
    var contentConfig = ContentConfig.default()
    try content(config: &contentConfig)
    services.register(contentConfig)

    var databasesConfig = DatabasesConfig()
    try databases(config: &databasesConfig)
    services.register(databasesConfig)

    services.register { (container) -> MigrationConfig in
        var migrationConfig = MigrationConfig()
        try migrate(migrations: &migrationConfig)
        return migrationConfig
    }
}

