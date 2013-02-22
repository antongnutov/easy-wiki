eventCompileStart = { kind ->
    def formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm")
    def buildDate = formatter.format(new Date())
    metadata.'app.buildDate' = buildDate
    metadata.persist()
}