"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const Account_1 = require("./model/Account");
const app = express();
const { Sequelize, Op, DataTypes } = require("sequelize");
const sequelize = new Sequelize("yusufadisaputrotest", "postgres", "1234", {
    host: "localhost",
    dialect: "postgres"
});
Account_1.Account.init({
    firstName: {
        type: DataTypes.STRING,
        defaultValue: "NO FIRST NAME"
    },
    lastName: {
        type: DataTypes.STRING,
        defaultValue: "NO LAST NAME"
    },
    userName: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    sequelize,
    modelName: 'User'
});
/**
 * APIs are bellow
 */
app.post("/create-account", async function (req, res) {
    if (req.query.password == "") {
        res.status(400);
        res.send("Fail to insert new Account");
    }
    else {
        let account;
        try {
            await sequelize.authenticate();
            await sequelize.sync();
            account = await Account_1.Account.create({
                userName: req.query.userName,
                password: req.query.password
            }).then(function (item) {
                res.status(200);
                res.send(item);
            }).catch(function (err) {
                res.status(400);
                res.send("Fail to insert new Account");
                throw "Fail to insert new Account";
            });
        }
        catch (error) {
            console.error('Unable to connect to the database:', error);
        }
    }
});
app.put("/edit-account/:userName", async function (req, res) {
    if (req.query.lastName == "" || req.query.firstName == "" || req.query.password == "") {
        res.status(400);
        res.send("Fail to update Account");
    }
    else {
        let account;
        try {
            await sequelize.authenticate();
            await sequelize.sync();
            account = await Account_1.Account.update({
                lastName: req.query.lastName,
                firstName: req.query.firstName,
                password: req.query.password,
            }, {
                where: {
                    userName: req.params.userName
                }
            }).then(function (item) {
                if (item == 0) {
                    res.send("failed to update (may not exist yet)");
                }
                else {
                    res.send("success");
                }
                console.log("item ", item);
            }).catch(function (err) {
                res.status(400);
                res.send("Fail to update Account");
                throw "Fail to update Account";
            });
        }
        catch (error) {
            console.error('Unable to connect to the database:', error);
        }
    }
});
app.delete("/delete-account/:userName", async function (req, res) {
    let account;
    try {
        await sequelize.authenticate();
        account = await Account_1.Account.destroy({
            where: {
                userName: req.params.userName
            }
        }).then(function (item) {
            res.status(200);
            if (item == 0) {
                res.send("failed to delete (may not exist yet)");
            }
            else {
                res.send("success");
            }
        }).catch(function (err) {
            res.status(400);
            res.send(err);
        });
    }
    catch (error) {
        console.error('Unable to connect to the database:', error);
    }
});
app.get("/get-all-accounts", async function (req, res) {
    let account;
    try {
        await sequelize.authenticate();
        await sequelize.sync();
        account = await Account_1.Account.findAll().then(function (item) {
            res.status(200);
            res.send(item);
        }).catch(function (err) {
            res.status(400);
            res.send("Fail to load Account");
            throw "Fail to load Account";
        });
    }
    catch (error) {
        console.error('Unable to connect to the database:', error);
    }
});
app.listen(3000, function () {
    console.log("Port 3000");
});
//# sourceMappingURL=server.js.map