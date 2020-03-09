<template>
    <div>
        <div>List:</div>
        <ul>
            <li v-for="user of users">
                {{user.firstname}} {{user.lastname}} ({{user.email}})
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
                .get('api/users')
                .then(response => {
                    this.users = response.data
                })
        }
    }
</script>