const base64toFormData : (base64url : string) => FormData = (base64url : string) => {
    const replacedUrl = base64url.replace(/data:image\/jpeg;base64,/, "");
    const byteString : string = window.atob(replacedUrl);
    const arrayBuffer = new ArrayBuffer(byteString.length);
    const int8Array = new Uint8Array(arrayBuffer);
    for (let i =0;i<byteString.length;i++) {
      int8Array[i] = byteString.charCodeAt(i);
    }
    const blob = new Blob([int8Array], { type : "image/png" });

    const formData = new FormData();
    formData.append('image',blob);

    return formData;
}

export default base64toFormData;