db = connect("mongodb://test1:test1@atlas-sql-67a77da2835cad3ae9e224ec-ckpe2.a.query.mongodb.net/myVirtualDatabase?ssl=true&authSource=admin");

for (let i = 1; i <= 100; i++) {
    db.users.insert({
        id: i.toString(),
        name: "User" + i,
        email: "user" + i + "@example.com"
    });
}