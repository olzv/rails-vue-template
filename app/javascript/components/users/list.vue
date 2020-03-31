<template>
    <div>
        <sui-table :columns="3">
            <sui-table-header>
                <sui-table-row>
                    <sui-table-header-cell>Name</sui-table-header-cell>
                    <sui-table-header-cell>Email</sui-table-header-cell>
                    <sui-table-header-cell>Status</sui-table-header-cell>
                </sui-table-row>
            </sui-table-header>
            <sui-table-body>
                <sui-table-row v-for="user of users">
                    <sui-table-cell>{{ user.fullName }}</sui-table-cell>
                    <sui-table-cell>{{ user.email }}</sui-table-cell>
                    <sui-table-cell>Approved</sui-table-cell>
                </sui-table-row>
            </sui-table-body>
        </sui-table>
    </div>
</template>

<script>
    import axios from 'axios'
    import User from "@models/user";

    export default {

        asyncComputed: {
            async users() {
                const response = await axios.get('api/v1/users')

                return response.data.map(userData => new User(userData) )
            }
        }
    }
</script>

