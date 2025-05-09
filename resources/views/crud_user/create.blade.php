@extends('dashboard')

@section('content')
<main>
    <div class="register-form">
        <h1>MÀN HÌNH ĐĂNG KÝ</h1>
        <form action="{{ route('user.postUser') }}" method="POST">
            @csrf
            <label for="username">Username</label>
            <input type="text" placeholder="Name" id="name" name="name" required autofocus><br>
            @if ($errors->has('name'))
                <span class="text-danger">{{ $errors->first('name') }}</span>
            @endif
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="email" required autofocus><br>
            @if ($errors->has('email'))
                <span class="text-danger">{{ $errors->first('email') }}</span>
            @endif

        <!-- <label for="username">Like</label>
            <input type="text" placeholder="Like" id="like" name="like" required autofocus><br>
            @if ($errors->has('like'))
                <span class="text-danger">{{ $errors->first('like') }}</span>
            @endif
            <label for="username">Github</label>
            <input type="text" placeholder="GitHub" id="github" name="github" required autofocus><br>
            @if ($errors->has('github'))
                <span class="text-danger">{{ $errors->first('github') }}</span>
            @endif -->

         


            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" placeholder="password" required autofocus><br>
            @if ($errors->has('password'))
                <span class="text-danger">{{ $errors->first('password') }}</span>
            @endif
            <!-- <label for="confirm_password">Nhập lại mật khẩu</label>
            <input type="password" id="confirm_password" name="confirm_password"><br> -->
            <a href="{{route('login')}}">Đã có tài khoản</a>
            <button type="submit">Đăng ký</button>
        </form>
    </div>
</main>
    @endsection