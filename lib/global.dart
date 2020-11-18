
const API ="https://louisnguyen.azurewebsites.net";

const GET_WRITER_POST = API + "/api/posts/WriterPost";
const GET_DESIGN_POST = API + "/api/posts/DesignPost";
const GET_TRANSLATE_POST = API + "/api/posts/TranslatePost";

const POST_LOGIN_USER = API + "/api/users/loginUser";
const POST_REQUESTED_POST = API + "/api/UsersHavingPosts/requestedPost";

const GET_REQUESTED_POST = API + "/api/UsersHavingPosts/requestedPosts";
const GET_ACCEPTED_POST = API + "/api/UsersHavingPosts/acceptedPosts";

const DELETE_REUESTED_POST = API + "/api/UsersHavingPosts/removeRequestedPost";

const GET_TRANSACTION_HISTORY_BY_USERNAME = API + "/api/TransactionHistories/getTransactions";

const PRESS_SUBMIT = API + "/api/TransactionHistories/transaction";

const GET_CURRENT_BEAN_BY_USERNAME = API +"/api/users/userBeans";
