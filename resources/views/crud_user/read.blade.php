@extends('dashboard')

@section('content')


<main>
    <div class="view-details">
        <h1>Màn hình chi tiết</h1>
        <p>{{$messi->id}}</p>
        <p><strong>Username:</strong>{{$messi->name}}</p>
        <p><strong>Email:</strong> {{$messi->email}}</p>
        <a href="{{ route('user.updateUser', ['id' => $messi->id]) }}" class="edit-button">Chỉnh sửa</a>
    </div>
</main>


@endsection