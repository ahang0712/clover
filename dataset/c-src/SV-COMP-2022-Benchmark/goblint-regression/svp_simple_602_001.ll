; ModuleID = 'svp_simple_602_001.bc'
source_filename = "./svp_simple_602_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A = global i32 5, align 4
@B = global i32 5, align 4

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
define i8* @generate(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8, !tbaa !25
  %5 = bitcast i32* %4 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5, !dbg !27
  store i32 1, i32* %4, align 4, !dbg !28, !tbaa !13
  br label %6, !dbg !29

6:                                                ; preds = %12, %1
  %7 = load i32, i32* %4, align 4, !dbg !30, !tbaa !13
  %8 = icmp slt i32 %7, 100, !dbg !31
  br i1 %8, label %9, label %15, !dbg !32

9:                                                ; preds = %6
  %10 = load i32, i32* %4, align 4, !dbg !33, !tbaa !13
  store i32 %10, i32* @A, align 4, !dbg !34, !tbaa !13
  store i32 5, i32* @A, align 4, !dbg !35, !tbaa !13
  %11 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !36
  br label %12, !dbg !37

12:                                               ; preds = %9
  %13 = load i32, i32* %4, align 4, !dbg !38, !tbaa !13
  %14 = add nsw i32 %13, 1, !dbg !38
  store i32 %14, i32* %4, align 4, !dbg !38, !tbaa !13
  br label %6, !dbg !32, !llvm.loop !39

15:                                               ; preds = %6
  %16 = bitcast i32* %4 to i8*, !dbg !40
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5, !dbg !40
  %17 = load i8*, i8** %2, align 8, !dbg !40
  ret i8* %17, !dbg !40
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @sleep(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i8* @process(i8* %0) #0 !dbg !41 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !25
  br label %4, !dbg !42

4:                                                ; preds = %1, %17
  %5 = load i32, i32* @A, align 4, !dbg !43, !tbaa !13
  %6 = icmp sgt i32 %5, 0, !dbg !44
  br i1 %6, label %7, label %15, !dbg !43

7:                                                ; preds = %4
  %8 = load i32, i32* @A, align 4, !dbg !45, !tbaa !13
  %9 = add nsw i32 %8, 1, !dbg !45
  store i32 %9, i32* @A, align 4, !dbg !45, !tbaa !13
  %10 = load i32, i32* @A, align 4, !dbg !46, !tbaa !13
  store i32 %10, i32* @B, align 4, !dbg !47, !tbaa !13
  %11 = load i32, i32* @B, align 4, !dbg !48, !tbaa !13
  %12 = add nsw i32 %11, -1, !dbg !48
  store i32 %12, i32* @B, align 4, !dbg !48, !tbaa !13
  %13 = load i32, i32* @A, align 4, !dbg !49, !tbaa !13
  %14 = add nsw i32 %13, -1, !dbg !49
  store i32 %14, i32* @A, align 4, !dbg !49, !tbaa !13
  br label %17, !dbg !50

15:                                               ; preds = %4
  %16 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2), !dbg !51
  br label %17

17:                                               ; preds = %15, %7
  br label %4, !dbg !42, !llvm.loop !52

18:                                               ; No predecessors!
  %19 = load i8*, i8** %2, align 8, !dbg !54
  ret i8* %19, !dbg !54
}

; Function Attrs: nounwind uwtable
define i8* @dispose(i8* %0) #0 !dbg !55 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8, !tbaa !25
  %5 = bitcast i32* %4 to i8*, !dbg !56
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5, !dbg !56
  br label %6, !dbg !57

6:                                                ; preds = %17, %1
  br label %7, !dbg !57

7:                                                ; preds = %6
  %8 = load i32, i32* @B, align 4, !dbg !58, !tbaa !13
  %9 = icmp sgt i32 %8, 0, !dbg !59
  br i1 %9, label %10, label %15, !dbg !58

10:                                               ; preds = %7
  %11 = load i32, i32* @B, align 4, !dbg !60, !tbaa !13
  store i32 %11, i32* %4, align 4, !dbg !61, !tbaa !13
  %12 = load i32, i32* %4, align 4, !dbg !62, !tbaa !13
  %13 = icmp eq i32 %12, 5, !dbg !63
  %14 = zext i1 %13 to i32, !dbg !63
  call void @__VERIFIER_assert(i32 %14), !dbg !64
  br label %17, !dbg !65

15:                                               ; preds = %7
  %16 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 5), !dbg !66
  br label %17

17:                                               ; preds = %15, %10
  br label %6, !dbg !57, !llvm.loop !67

18:                                               ; No predecessors!
  %19 = load i8*, i8** %2, align 8, !dbg !69
  ret i8* %19, !dbg !69
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_602_001_main() #0 !dbg !70 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !71
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !71
  store i32 0, i32* %1, align 4, !dbg !72, !tbaa !13
  br label %3, !dbg !73

3:                                                ; preds = %12, %0
  %4 = load i32, i32* %1, align 4, !dbg !74, !tbaa !13
  %5 = icmp slt i32 %4, 10, !dbg !75
  br i1 %5, label %6, label %15, !dbg !76

6:                                                ; preds = %3
  %7 = load i32, i32* @A, align 4, !dbg !77, !tbaa !13
  %8 = load i32, i32* @B, align 4, !dbg !78, !tbaa !13
  %9 = icmp eq i32 %7, %8, !dbg !79
  %10 = zext i1 %9 to i32, !dbg !79
  call void @__VERIFIER_assert(i32 %10), !dbg !80
  %11 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 3), !dbg !81
  br label %12, !dbg !82

12:                                               ; preds = %6
  %13 = load i32, i32* %1, align 4, !dbg !83, !tbaa !13
  %14 = add nsw i32 %13, 1, !dbg !83
  store i32 %14, i32* %1, align 4, !dbg !83, !tbaa !13
  br label %3, !dbg !76, !llvm.loop !84

15:                                               ; preds = %3
  %16 = bitcast i32* %1 to i8*, !dbg !85
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5, !dbg !85
  ret i32 0, !dbg !86
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
!1 = !DIFile(filename: "svp_simple_602_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_602_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 3, column: 41, scope: !12)
!18 = !DILocation(line: 3, column: 40, scope: !12)
!19 = !DILocation(line: 3, column: 39, scope: !12)
!20 = !DILocation(line: 3, column: 48, scope: !12)
!21 = !DILocation(line: 3, column: 58, scope: !12)
!22 = !DILocation(line: 3, column: 72, scope: !12)
!23 = !DILocation(line: 3, column: 84, scope: !12)
!24 = distinct !DISubprogram(name: "generate", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !15, i64 0}
!27 = !DILocation(line: 11, column: 3, scope: !24)
!28 = !DILocation(line: 12, column: 9, scope: !24)
!29 = !DILocation(line: 12, column: 8, scope: !24)
!30 = !DILocation(line: 12, column: 13, scope: !24)
!31 = !DILocation(line: 12, column: 14, scope: !24)
!32 = !DILocation(line: 12, column: 3, scope: !24)
!33 = !DILocation(line: 14, column: 9, scope: !24)
!34 = !DILocation(line: 14, column: 7, scope: !24)
!35 = !DILocation(line: 15, column: 7, scope: !24)
!36 = !DILocation(line: 17, column: 5, scope: !24)
!37 = !DILocation(line: 18, column: 3, scope: !24)
!38 = !DILocation(line: 12, column: 21, scope: !24)
!39 = distinct !{!39, !32, !37}
!40 = !DILocation(line: 19, column: 1, scope: !24)
!41 = distinct !DISubprogram(name: "process", scope: !8, file: !8, line: 21, type: !9, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 22, column: 3, scope: !41)
!43 = !DILocation(line: 24, column: 9, scope: !41)
!44 = !DILocation(line: 24, column: 11, scope: !41)
!45 = !DILocation(line: 25, column: 8, scope: !41)
!46 = !DILocation(line: 26, column: 11, scope: !41)
!47 = !DILocation(line: 26, column: 9, scope: !41)
!48 = !DILocation(line: 27, column: 8, scope: !41)
!49 = !DILocation(line: 28, column: 8, scope: !41)
!50 = !DILocation(line: 29, column: 5, scope: !41)
!51 = !DILocation(line: 31, column: 5, scope: !41)
!52 = distinct !{!52, !42, !53}
!53 = !DILocation(line: 32, column: 3, scope: !41)
!54 = !DILocation(line: 33, column: 1, scope: !41)
!55 = distinct !DISubprogram(name: "dispose", scope: !8, file: !8, line: 35, type: !9, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 36, column: 3, scope: !55)
!57 = !DILocation(line: 37, column: 3, scope: !55)
!58 = !DILocation(line: 38, column: 9, scope: !55)
!59 = !DILocation(line: 38, column: 11, scope: !55)
!60 = !DILocation(line: 39, column: 11, scope: !55)
!61 = !DILocation(line: 39, column: 9, scope: !55)
!62 = !DILocation(line: 40, column: 25, scope: !55)
!63 = !DILocation(line: 40, column: 27, scope: !55)
!64 = !DILocation(line: 40, column: 7, scope: !55)
!65 = !DILocation(line: 41, column: 5, scope: !55)
!66 = !DILocation(line: 43, column: 5, scope: !55)
!67 = distinct !{!67, !57, !68}
!68 = !DILocation(line: 44, column: 3, scope: !55)
!69 = !DILocation(line: 45, column: 1, scope: !55)
!70 = distinct !DISubprogram(name: "svp_simple_602_001_main", scope: !8, file: !8, line: 47, type: !9, scopeLine: 47, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 48, column: 3, scope: !70)
!72 = !DILocation(line: 50, column: 9, scope: !70)
!73 = !DILocation(line: 50, column: 8, scope: !70)
!74 = !DILocation(line: 50, column: 13, scope: !70)
!75 = !DILocation(line: 50, column: 14, scope: !70)
!76 = !DILocation(line: 50, column: 3, scope: !70)
!77 = !DILocation(line: 53, column: 23, scope: !70)
!78 = !DILocation(line: 53, column: 28, scope: !70)
!79 = !DILocation(line: 53, column: 25, scope: !70)
!80 = !DILocation(line: 53, column: 5, scope: !70)
!81 = !DILocation(line: 57, column: 5, scope: !70)
!82 = !DILocation(line: 58, column: 3, scope: !70)
!83 = !DILocation(line: 50, column: 20, scope: !70)
!84 = distinct !{!84, !76, !82}
!85 = !DILocation(line: 60, column: 1, scope: !70)
!86 = !DILocation(line: 59, column: 3, scope: !70)
