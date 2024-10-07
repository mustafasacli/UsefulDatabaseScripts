-- https://stackoverflow.com/questions/35352060/odp-net-oracle-manageddataacess-random-ora-12570-errors/35369594#35369594
I randomly receive this error for years because my connection can be lost in many ways.
I have put together the solutions that worked for me.

1. Keeping the Connection Alive
1.1 Using KeepAlive Property
The KeepAlive property, when set to true, enables the periodic transmission of messages on the connection to prevent idle connections to be dropped. The KeepAlive time (the time the connection will remain idle before it sends a keepalive probe) is one minute by default.

Set KeepAlive on .NET

connection.KeepAlive = true;
1.2 Using EXPIRE_TIME Parameter in client
The EXPIRE_TIME parameter in the sqlnet.ora file determines how frequently the Oracle will search for Dead connections. Setting EXPIRE_TIME to 1 means that Oracle checks the connection every minute, this will help to keep the valid connections active.

In .NET Framework set it on web.config or app.config:

<system.web>
...
<oracle.manageddataaccess.client>
    <version number="*">
        <settings>
            <setting name="TNS_ADMIN" value="C:\Pronet\Config"/>
            <setting name="SQLNET.EXPIRE_TIME" value="1"/>
        </settings>
    </version>
</oracle.manageddataaccess.client>
...
<system.web>
In .NET Core:
.NET Core does not have an equivalent setting. However, you can create a sqlnet.ora file and include the EXPIRE_TIME option in it.

SQLNET.EXPIRE_TIME = 1
Save this file in the TNS_ADMIN folder or in the bin folder for the project.