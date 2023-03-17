const base64toFormData: (base64url: string) => FormData = (
  base64url: string
) => {
  const replacedUrl = base64url.split(",")[1];
  const byteString : string = window.atob(replacedUrl);
  const arrayBuffer = new ArrayBuffer(byteString.length);
  const int8Array = new Uint8Array(arrayBuffer);
  for (let i =0;i<byteString.length;i++) {
    int8Array[i] = byteString.charCodeAt(i);
  }

  const type = base64url.split(":")[1].split(";")[0];
  console.log(type);
  const blob = new Blob([int8Array], { type : type });

  const formData = new FormData();
  formData.append("image", blob);

  return formData;
};

export default base64toFormData;
