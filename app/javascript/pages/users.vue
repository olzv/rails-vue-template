<template>
    <div>
        <div>List:</div>
        <ul>
            <li v-for="user of users">
                {{user.first_name}} {{user.last_name}} ({{user.email}})
            </li>
        </ul>
    </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data () {
            return {
                users: []
            }
        },
        mounted () {
            axios
                .get('api/v1/users')
                .then(response => {
                    this.users = response.data
                })
        }
    }
</script>