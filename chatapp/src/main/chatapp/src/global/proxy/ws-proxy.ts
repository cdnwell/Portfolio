const { createProxyMiddleware } = require("http-proxy-middleware");

module.exports = (app: any) => {
  app.use(
    "/api",
    createProxyMiddleware({
      target: "http://localhost:9700",
      changeOrigin: true,
    })
  );
  app.use(
    "/ws-stomp",
    createProxyMiddleware({ target: "http://localhost:9700", ws: true })
  );
};