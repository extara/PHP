addEventHandler("onResourceStart",resourceRoot, function()
        db = dbConnect( "mysql", "dbname=;host=databaseip;charset=utf8", "login", "password", "share=0" )
end)

function getConnection()
    return db

end



