; ModuleID = 'svp_simple_024_001.bc'
source_filename = "./svp_simple_024_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.bytetoword = type { i32 }

@svp_simple_024_001_global_array = common global [100 x i32*] zeroinitializer, align 16
@svp_simple_024_001_reset_RT = common global i8 0, align 1
@svp_simple_024_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_main() #0 !dbg !7 {
  %1 = alloca %union.bytetoword, align 4
  %2 = alloca %union.bytetoword, align 4
  %3 = alloca i32, align 4
  %4 = bitcast %union.bytetoword* %1 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !10
  %5 = bitcast %union.bytetoword* %2 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !10
  call void @svp_simple_024_001_init(), !dbg !11
  %6 = call i32 @svp_simple_024_001_RTData(i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i32 0), !dbg !12
  %7 = bitcast %union.bytetoword* %1 to i32*, !dbg !13
  store i32 %6, i32* %7, align 4, !dbg !14, !tbaa !15
  %8 = call i32 @svp_simple_024_001_RTData(i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i32 1), !dbg !18
  %9 = bitcast %union.bytetoword* %2 to i32*, !dbg !19
  store i32 %8, i32* %9, align 4, !dbg !20, !tbaa !15
  %10 = bitcast i32* %3 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !21
  %11 = bitcast %union.bytetoword* %1 to i32*, !dbg !22
  %12 = load i32, i32* %11, align 4, !dbg !22, !tbaa !15
  %13 = bitcast %union.bytetoword* %2 to i32*, !dbg !23
  %14 = load i32, i32* %13, align 4, !dbg !23, !tbaa !15
  %15 = and i32 %14, 752, !dbg !24
  %16 = or i32 %12, %15, !dbg !25
  store i32 %16, i32* %3, align 4, !dbg !26, !tbaa !27
  %17 = load i32, i32* %3, align 4, !dbg !29, !tbaa !27
  switch i32 %17, label %20 [
    i32 752, label %18
    i32 912, label %19
  ], !dbg !30

18:                                               ; preds = %0
  store volatile i8 1, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !31, !tbaa !15
  br label %21, !dbg !32

19:                                               ; preds = %0
  store volatile i8 0, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !33, !tbaa !15
  br label %21, !dbg !34

20:                                               ; preds = %0
  br label %21, !dbg !35

21:                                               ; preds = %20, %19, %18
  %22 = bitcast i32* %3 to i8*, !dbg !36
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3, !dbg !36
  %23 = bitcast %union.bytetoword* %2 to i8*, !dbg !36
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #3, !dbg !36
  %24 = bitcast %union.bytetoword* %1 to i8*, !dbg !36
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #3, !dbg !36
  ret void, !dbg !36
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_024_001_RTData(i32* %0, i32 %1) #0 !dbg !37 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %union.bytetoword, align 4
  store i32* %0, i32** %3, align 8, !tbaa !38
  store i32 %1, i32* %4, align 4, !tbaa !27
  %6 = bitcast %union.bytetoword* %5 to i8*, !dbg !40
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !40
  %7 = load i32*, i32** %3, align 8, !dbg !41, !tbaa !38
  %8 = load i32, i32* %4, align 4, !dbg !42, !tbaa !27
  %9 = add nsw i32 %8, 1, !dbg !43
  %10 = sext i32 %9 to i64, !dbg !41
  %11 = getelementptr inbounds i32, i32* %7, i64 %10, !dbg !41
  %12 = load i32, i32* %11, align 4, !dbg !41, !tbaa !27
  %13 = trunc i32 %12 to i8, !dbg !41
  %14 = bitcast %union.bytetoword* %5 to [2 x i8]*, !dbg !44
  %15 = getelementptr inbounds [2 x i8], [2 x i8]* %14, i64 0, i64 0, !dbg !45
  store i8 %13, i8* %15, align 4, !dbg !46, !tbaa !15
  %16 = load i32*, i32** %3, align 8, !dbg !47, !tbaa !38
  %17 = load i32, i32* %4, align 4, !dbg !48, !tbaa !27
  %18 = sext i32 %17 to i64, !dbg !47
  %19 = getelementptr inbounds i32, i32* %16, i64 %18, !dbg !47
  %20 = load i32, i32* %19, align 4, !dbg !47, !tbaa !27
  %21 = trunc i32 %20 to i8, !dbg !47
  %22 = bitcast %union.bytetoword* %5 to [2 x i8]*, !dbg !49
  %23 = getelementptr inbounds [2 x i8], [2 x i8]* %22, i64 0, i64 1, !dbg !50
  store i8 %21, i8* %23, align 1, !dbg !51, !tbaa !15
  %24 = bitcast %union.bytetoword* %5 to i32*, !dbg !52
  %25 = load i32, i32* %24, align 4, !dbg !52, !tbaa !15
  %26 = bitcast %union.bytetoword* %5 to i8*, !dbg !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #3, !dbg !53
  ret i32 %25, !dbg !54
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_init() #0 !dbg !55 {
  %1 = call i32 (...) @rand(), !dbg !56
  store volatile i32 %1, i32* @svp_simple_024_001_global_var, align 4, !dbg !57, !tbaa !27
  call void (...) @init(), !dbg !58
  ret void, !dbg !59
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_isr_1() #0 !dbg !60 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !61
  store i32 0, i32* %1, align 4, !dbg !62, !tbaa !27
  br label %3, !dbg !61

3:                                                ; preds = %12, %0
  %4 = load i32, i32* %1, align 4, !dbg !63, !tbaa !27
  %5 = icmp slt i32 %4, 100, !dbg !64
  br i1 %5, label %8, label %6, !dbg !65

6:                                                ; preds = %3
  %7 = bitcast i32* %1 to i8*, !dbg !65
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #3, !dbg !65
  br label %15

8:                                                ; preds = %3
  %9 = load i32, i32* %1, align 4, !dbg !66, !tbaa !27
  %10 = sext i32 %9 to i64, !dbg !67
  %11 = getelementptr inbounds [100 x i32*], [100 x i32*]* @svp_simple_024_001_global_array, i64 0, i64 %10, !dbg !67
  store i32* null, i32** %11, align 8, !dbg !68, !tbaa !38
  br label %12, !dbg !69

12:                                               ; preds = %8
  %13 = load i32, i32* %1, align 4, !dbg !70, !tbaa !27
  %14 = add nsw i32 %13, 1, !dbg !70
  store i32 %14, i32* %1, align 4, !dbg !70, !tbaa !27
  br label %3, !dbg !65, !llvm.loop !71

15:                                               ; preds = %6
  ret void, !dbg !72
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_024_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_024")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_024_001_main", scope: !8, file: !8, line: 29, type: !9, scopeLine: 29, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_024_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_024")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 30, column: 3, scope: !7)
!11 = !DILocation(line: 31, column: 3, scope: !7)
!12 = !DILocation(line: 32, column: 41, scope: !7)
!13 = !DILocation(line: 32, column: 30, scope: !7)
!14 = !DILocation(line: 32, column: 39, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 33, column: 41, scope: !7)
!19 = !DILocation(line: 33, column: 30, scope: !7)
!20 = !DILocation(line: 33, column: 39, scope: !7)
!21 = !DILocation(line: 34, column: 3, scope: !7)
!22 = !DILocation(line: 35, column: 34, scope: !7)
!23 = !DILocation(line: 35, column: 72, scope: !7)
!24 = !DILocation(line: 35, column: 81, scope: !7)
!25 = !DILocation(line: 35, column: 43, scope: !7)
!26 = !DILocation(line: 34, column: 7, scope: !7)
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !16, i64 0}
!29 = !DILocation(line: 37, column: 11, scope: !7)
!30 = !DILocation(line: 37, column: 3, scope: !7)
!31 = !DILocation(line: 39, column: 35, scope: !7)
!32 = !DILocation(line: 40, column: 7, scope: !7)
!33 = !DILocation(line: 42, column: 35, scope: !7)
!34 = !DILocation(line: 43, column: 7, scope: !7)
!35 = !DILocation(line: 45, column: 7, scope: !7)
!36 = !DILocation(line: 47, column: 1, scope: !7)
!37 = distinct !DISubprogram(name: "svp_simple_024_001_RTData", scope: !8, file: !8, line: 54, type: !9, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!38 = !{!39, !39, i64 0}
!39 = !{!"any pointer", !16, i64 0}
!40 = !DILocation(line: 55, column: 3, scope: !37)
!41 = !DILocation(line: 56, column: 44, scope: !37)
!42 = !DILocation(line: 56, column: 50, scope: !37)
!43 = !DILocation(line: 56, column: 56, scope: !37)
!44 = !DILocation(line: 56, column: 30, scope: !37)
!45 = !DILocation(line: 56, column: 3, scope: !37)
!46 = !DILocation(line: 56, column: 42, scope: !37)
!47 = !DILocation(line: 57, column: 44, scope: !37)
!48 = !DILocation(line: 57, column: 50, scope: !37)
!49 = !DILocation(line: 57, column: 30, scope: !37)
!50 = !DILocation(line: 57, column: 3, scope: !37)
!51 = !DILocation(line: 57, column: 42, scope: !37)
!52 = !DILocation(line: 59, column: 37, scope: !37)
!53 = !DILocation(line: 60, column: 1, scope: !37)
!54 = !DILocation(line: 59, column: 3, scope: !37)
!55 = distinct !DISubprogram(name: "svp_simple_024_001_init", scope: !8, file: !8, line: 48, type: !9, scopeLine: 48, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 49, column: 35, scope: !55)
!57 = !DILocation(line: 49, column: 33, scope: !55)
!58 = !DILocation(line: 51, column: 3, scope: !55)
!59 = !DILocation(line: 52, column: 1, scope: !55)
!60 = distinct !DISubprogram(name: "svp_simple_024_001_isr_1", scope: !8, file: !8, line: 61, type: !9, scopeLine: 61, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 62, column: 8, scope: !60)
!62 = !DILocation(line: 62, column: 12, scope: !60)
!63 = !DILocation(line: 62, column: 19, scope: !60)
!64 = !DILocation(line: 62, column: 21, scope: !60)
!65 = !DILocation(line: 62, column: 3, scope: !60)
!66 = !DILocation(line: 63, column: 37, scope: !60)
!67 = !DILocation(line: 63, column: 5, scope: !60)
!68 = !DILocation(line: 63, column: 40, scope: !60)
!69 = !DILocation(line: 64, column: 3, scope: !60)
!70 = !DILocation(line: 62, column: 29, scope: !60)
!71 = distinct !{!71, !65, !69}
!72 = !DILocation(line: 65, column: 1, scope: !60)
