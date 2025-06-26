; ModuleID = 'svp_simple_643_001.bc'
source_filename = "./svp_simple_643_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !17, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !18
  br i1 %4, label %7, label %5, !dbg !19

5:                                                ; preds = %1
  br label %6, !dbg !20

6:                                                ; preds = %5
  call void @reach_error(), !dbg !21
  call void @abort() #4, !dbg !22
  unreachable, !dbg !22

7:                                                ; preds = %1
  ret void, !dbg !23
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @pqueue_init() #0 !dbg !24 {
  store i32 0, i32* @g, align 4, !dbg !25, !tbaa !13
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind uwtable
define i32 @pqueue_put() #0 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @g, align 4, !dbg !28, !tbaa !13
  %3 = icmp slt i32 %2, 1000, !dbg !29
  br i1 %3, label %4, label %10, !dbg !28

4:                                                ; preds = %0
  %5 = bitcast i32* %1 to i8*, !dbg !30
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5, !dbg !30
  %6 = load i32, i32* @g, align 4, !dbg !31, !tbaa !13
  %7 = add nsw i32 %6, 1, !dbg !32
  store i32 %7, i32* %1, align 4, !dbg !33, !tbaa !13
  %8 = load i32, i32* %1, align 4, !dbg !34, !tbaa !13
  store i32 %8, i32* @g, align 4, !dbg !35, !tbaa !13
  %9 = bitcast i32* %1 to i8*, !dbg !36
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #5, !dbg !36
  br label %10, !dbg !36

10:                                               ; preds = %4, %0
  ret i32 1, !dbg !37
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @pqueue_get() #0 !dbg !38 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !39
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5, !dbg !39
  store i32 0, i32* %1, align 4, !dbg !40, !tbaa !13
  %4 = load i32, i32* @g, align 4, !dbg !41, !tbaa !13
  %5 = icmp eq i32 %4, 0, !dbg !42
  %6 = zext i1 %5 to i32, !dbg !42
  call void @__VERIFIER_assert(i32 %6), !dbg !43
  %7 = load i32, i32* @g, align 4, !dbg !44, !tbaa !13
  %8 = icmp ne i32 %7, 0, !dbg !45
  %9 = zext i1 %8 to i32, !dbg !45
  call void @__VERIFIER_assert(i32 %9), !dbg !46
  %10 = load i32, i32* @g, align 4, !dbg !47, !tbaa !13
  %11 = icmp sgt i32 %10, 0, !dbg !48
  br i1 %11, label %12, label %18, !dbg !47

12:                                               ; preds = %0
  %13 = bitcast i32* %2 to i8*, !dbg !49
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #5, !dbg !49
  %14 = load i32, i32* @g, align 4, !dbg !50, !tbaa !13
  %15 = sub nsw i32 %14, 1, !dbg !51
  store i32 %15, i32* %2, align 4, !dbg !52, !tbaa !13
  %16 = load i32, i32* %2, align 4, !dbg !53, !tbaa !13
  store i32 %16, i32* @g, align 4, !dbg !54, !tbaa !13
  store i32 1, i32* %1, align 4, !dbg !55, !tbaa !13
  %17 = bitcast i32* %2 to i8*, !dbg !56
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5, !dbg !56
  br label %18, !dbg !56

18:                                               ; preds = %12, %0
  %19 = load i32, i32* %1, align 4, !dbg !57, !tbaa !13
  %20 = bitcast i32* %1 to i8*, !dbg !58
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5, !dbg !58
  ret i32 %19, !dbg !59
}

; Function Attrs: nounwind uwtable
define i32 @isr_pqueue_get() #0 !dbg !60 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !61
  store i32 0, i32* %1, align 4, !dbg !62, !tbaa !13
  %3 = load i32, i32* @g, align 4, !dbg !63, !tbaa !13
  %4 = icmp eq i32 %3, 0, !dbg !64
  %5 = zext i1 %4 to i32, !dbg !64
  call void @__VERIFIER_assert(i32 %5), !dbg !65
  %6 = load i32, i32* @g, align 4, !dbg !66, !tbaa !13
  %7 = icmp ne i32 %6, 0, !dbg !67
  %8 = zext i1 %7 to i32, !dbg !67
  call void @__VERIFIER_assert(i32 %8), !dbg !68
  %9 = load i32, i32* @g, align 4, !dbg !69, !tbaa !13
  %10 = icmp sgt i32 %9, 0, !dbg !70
  br i1 %10, label %11, label %14, !dbg !69

11:                                               ; preds = %0
  %12 = load i32, i32* @g, align 4, !dbg !71, !tbaa !13
  %13 = add nsw i32 %12, -1, !dbg !71
  store i32 %13, i32* @g, align 4, !dbg !71, !tbaa !13
  store i32 1, i32* %1, align 4, !dbg !72, !tbaa !13
  br label %14, !dbg !73

14:                                               ; preds = %11, %0
  %15 = load i32, i32* %1, align 4, !dbg !74, !tbaa !13
  %16 = bitcast i32* %1 to i8*, !dbg !75
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5, !dbg !75
  ret i32 %15, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @svp_simple_643_001_isr1(i8* %0) #0 !dbg !77 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !78
  %3 = call i32 @isr_pqueue_get(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_643_001_main(i32 %0, i8** %1) #0 !dbg !82 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4, !tbaa !13
  store i8** %1, i8*** %4, align 8, !tbaa !78
  %7 = call i32 @pqueue_init(), !dbg !83
  %8 = bitcast i32* %5 to i8*, !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #5, !dbg !84
  store i32 5, i32* %5, align 4, !dbg !85, !tbaa !13
  %9 = bitcast i32* %6 to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #5, !dbg !86
  store i32 1, i32* %6, align 4, !dbg !87, !tbaa !13
  br label %10, !dbg !86

10:                                               ; preds = %17, %2
  %11 = load i32, i32* %6, align 4, !dbg !88, !tbaa !13
  %12 = icmp slt i32 %11, 5, !dbg !89
  br i1 %12, label %15, label %13, !dbg !90

13:                                               ; preds = %10
  %14 = bitcast i32* %6 to i8*, !dbg !90
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #5, !dbg !90
  br label %20

15:                                               ; preds = %10
  %16 = call i32 @pqueue_put(), !dbg !91
  br label %17, !dbg !92

17:                                               ; preds = %15
  %18 = load i32, i32* %6, align 4, !dbg !93, !tbaa !13
  %19 = add nsw i32 %18, 1, !dbg !93
  store i32 %19, i32* %6, align 4, !dbg !93, !tbaa !13
  br label %10, !dbg !90, !llvm.loop !94

20:                                               ; preds = %13
  %21 = bitcast i32* %5 to i8*, !dbg !95
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5, !dbg !95
  ret i32 0, !dbg !96
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_643_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_643_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 5, column: 9, scope: !12)
!18 = !DILocation(line: 5, column: 8, scope: !12)
!19 = !DILocation(line: 5, column: 7, scope: !12)
!20 = !DILocation(line: 6, column: 3, scope: !12)
!21 = !DILocation(line: 9, column: 5, scope: !12)
!22 = !DILocation(line: 10, column: 5, scope: !12)
!23 = !DILocation(line: 13, column: 1, scope: !12)
!24 = distinct !DISubprogram(name: "pqueue_init", scope: !8, file: !8, line: 17, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 19, column: 5, scope: !24)
!26 = !DILocation(line: 20, column: 3, scope: !24)
!27 = distinct !DISubprogram(name: "pqueue_put", scope: !8, file: !8, line: 23, type: !9, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = !DILocation(line: 26, column: 7, scope: !27)
!29 = !DILocation(line: 26, column: 9, scope: !27)
!30 = !DILocation(line: 28, column: 5, scope: !27)
!31 = !DILocation(line: 28, column: 15, scope: !27)
!32 = !DILocation(line: 28, column: 17, scope: !27)
!33 = !DILocation(line: 28, column: 9, scope: !27)
!34 = !DILocation(line: 29, column: 9, scope: !27)
!35 = !DILocation(line: 29, column: 7, scope: !27)
!36 = !DILocation(line: 31, column: 3, scope: !27)
!37 = !DILocation(line: 33, column: 3, scope: !27)
!38 = distinct !DISubprogram(name: "pqueue_get", scope: !8, file: !8, line: 36, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 38, column: 3, scope: !38)
!40 = !DILocation(line: 38, column: 7, scope: !38)
!41 = !DILocation(line: 40, column: 21, scope: !38)
!42 = !DILocation(line: 40, column: 23, scope: !38)
!43 = !DILocation(line: 40, column: 3, scope: !38)
!44 = !DILocation(line: 42, column: 21, scope: !38)
!45 = !DILocation(line: 42, column: 23, scope: !38)
!46 = !DILocation(line: 42, column: 3, scope: !38)
!47 = !DILocation(line: 43, column: 7, scope: !38)
!48 = !DILocation(line: 43, column: 9, scope: !38)
!49 = !DILocation(line: 45, column: 5, scope: !38)
!50 = !DILocation(line: 45, column: 15, scope: !38)
!51 = !DILocation(line: 45, column: 17, scope: !38)
!52 = !DILocation(line: 45, column: 9, scope: !38)
!53 = !DILocation(line: 46, column: 9, scope: !38)
!54 = !DILocation(line: 46, column: 7, scope: !38)
!55 = !DILocation(line: 48, column: 9, scope: !38)
!56 = !DILocation(line: 49, column: 3, scope: !38)
!57 = !DILocation(line: 51, column: 11, scope: !38)
!58 = !DILocation(line: 52, column: 1, scope: !38)
!59 = !DILocation(line: 51, column: 3, scope: !38)
!60 = distinct !DISubprogram(name: "isr_pqueue_get", scope: !8, file: !8, line: 54, type: !9, scopeLine: 55, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 56, column: 3, scope: !60)
!62 = !DILocation(line: 56, column: 7, scope: !60)
!63 = !DILocation(line: 58, column: 21, scope: !60)
!64 = !DILocation(line: 58, column: 23, scope: !60)
!65 = !DILocation(line: 58, column: 3, scope: !60)
!66 = !DILocation(line: 60, column: 21, scope: !60)
!67 = !DILocation(line: 60, column: 23, scope: !60)
!68 = !DILocation(line: 60, column: 3, scope: !60)
!69 = !DILocation(line: 61, column: 7, scope: !60)
!70 = !DILocation(line: 61, column: 9, scope: !60)
!71 = !DILocation(line: 63, column: 6, scope: !60)
!72 = !DILocation(line: 64, column: 9, scope: !60)
!73 = !DILocation(line: 65, column: 3, scope: !60)
!74 = !DILocation(line: 67, column: 11, scope: !60)
!75 = !DILocation(line: 68, column: 1, scope: !60)
!76 = !DILocation(line: 67, column: 3, scope: !60)
!77 = distinct !DISubprogram(name: "svp_simple_643_001_isr1", scope: !8, file: !8, line: 70, type: !9, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!78 = !{!79, !79, i64 0}
!79 = !{!"any pointer", !15, i64 0}
!80 = !DILocation(line: 73, column: 3, scope: !77)
!81 = !DILocation(line: 74, column: 1, scope: !77)
!82 = distinct !DISubprogram(name: "svp_simple_643_001_main", scope: !8, file: !8, line: 76, type: !9, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 79, column: 3, scope: !82)
!84 = !DILocation(line: 81, column: 3, scope: !82)
!85 = !DILocation(line: 81, column: 7, scope: !82)
!86 = !DILocation(line: 82, column: 8, scope: !82)
!87 = !DILocation(line: 82, column: 12, scope: !82)
!88 = !DILocation(line: 82, column: 19, scope: !82)
!89 = !DILocation(line: 82, column: 21, scope: !82)
!90 = !DILocation(line: 82, column: 3, scope: !82)
!91 = !DILocation(line: 84, column: 5, scope: !82)
!92 = !DILocation(line: 85, column: 3, scope: !82)
!93 = !DILocation(line: 82, column: 27, scope: !82)
!94 = distinct !{!94, !90, !92}
!95 = !DILocation(line: 87, column: 1, scope: !82)
!96 = !DILocation(line: 86, column: 3, scope: !82)
