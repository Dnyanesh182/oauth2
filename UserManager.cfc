<cfcomponent displayname="UserManager" hint="Handles user operations">

    <!--- Property for storing users --->
    <cfproperty name="users" type="array" default="#ArrayNew(1)#" />

    <!--- Add a new user --->
    <cffunction name="addUser" access="public" returntype="void" hint="Adds a user to the list">
        <cfargument name="username" type="string" required="true" />
        <cfargument name="email" type="string" required="true" />

        <cfset var newUser = {
            username = arguments.username,
            email = arguments.email,
            createdAt = Now()
        } />

        <cfset ArrayAppend(variables.users, newUser) />
    </cffunction>

    <!--- Get all users --->
    <cffunction name="getUsers" access="public" returntype="array" hint="Returns all users">
        <cfreturn variables.users />
    </cffunction>

    <!--- Find user by username --->
    <cffunction name="findUser" access="public" returntype="struct" hint="Finds a user by username">
        <cfargument name="username" type="string" required="true" />
        <cfset var foundUser = {} />

        <cfloop array="#variables.users#" index="user">
            <cfif user.username eq arguments.username>
                <cfset foundUser = user />
                <cfbreak />
            </cfif>
        </cfloop>

        <cfreturn foundUser />
    </cffunction>

</cfcomponent>
