<template>
    <div>
        <div>List:</div>
        <ul>
            <li v-for="user of users">
                {{user.first_name}} {{user.last_name}} ({{user.email}})
            </li>
        </ul>
        <br>
        <create></create>
    </div>
</template>

<script>
    import axios from 'axios'
    import create from '../components/users/create'

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
        },
        components: {
            create
        }
    }
</script>