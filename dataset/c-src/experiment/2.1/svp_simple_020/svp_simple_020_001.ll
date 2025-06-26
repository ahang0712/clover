; ModuleID = 'svp_simple_020_001.bc'
source_filename = "./svp_simple_020_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_020_001_global_flag = global i32 0, align 4
@svp_simple_020_001_global_para = common global i32 0, align 4
@svp_simple_020_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_020_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  call void @disable_isr(i32 2), !dbg !11
  %5 = bitcast i32* %1 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !12
  %6 = bitcast i32* %2 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !12
  %7 = bitcast i32* %3 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !13
  %8 = bitcast i32* %4 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !13
  %9 = call i32 (...) @rand(), !dbg !14
  store i32 %9, i32* %3, align 4, !dbg !15, !tbaa !16
  %10 = call i32 (...) @rand(), !dbg !20
  store i32 %10, i32* %4, align 4, !dbg !21, !tbaa !16
  %11 = load i32, i32* %3, align 4, !dbg !22, !tbaa !16
  %12 = load i32, i32* %4, align 4, !dbg !23, !tbaa !16
  %13 = add nsw i32 %11, %12, !dbg !24
  %14 = load volatile i32, i32* @svp_simple_020_001_global_para, align 4, !dbg !25, !tbaa !16
  %15 = icmp sgt i32 %13, %14, !dbg !26
  br i1 %15, label %16, label %18, !dbg !22

16:                                               ; preds = %0
  %17 = load volatile i32, i32* @svp_simple_020_001_global_var, align 4, !dbg !27, !tbaa !16
  store i32 %17, i32* %1, align 4, !dbg !28, !tbaa !16
  br label %18, !dbg !29

18:                                               ; preds = %16, %0
  %19 = load i32, i32* %3, align 4, !dbg !30, !tbaa !16
  %20 = load i32, i32* %4, align 4, !dbg !31, !tbaa !16
  %21 = add nsw i32 %19, %20, !dbg !32
  %22 = load volatile i32, i32* @svp_simple_020_001_global_para, align 4, !dbg !33, !tbaa !16
  %23 = icmp slt i32 %21, %22, !dbg !34
  br i1 %23, label %24, label %26, !dbg !30

24:                                               ; preds = %18
  %25 = load volatile i32, i32* @svp_simple_020_001_global_var, align 4, !dbg !35, !tbaa !16
  store i32 %25, i32* %2, align 4, !dbg !36, !tbaa !16
  br label %26, !dbg !37

26:                                               ; preds = %24, %18
  %27 = bitcast i32* %4 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #3, !dbg !38
  %28 = bitcast i32* %3 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3, !dbg !38
  %29 = bitcast i32* %2 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3, !dbg !38
  %30 = bitcast i32* %1 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3, !dbg !38
  ret void, !dbg !38
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare i32 @rand(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_020_001_isr_1() #0 !dbg !39 {
  store volatile i32 1, i32* @svp_simple_020_001_global_var, align 4, !dbg !40, !tbaa !16
  store volatile i32 1, i32* @svp_simple_020_001_global_flag, align 4, !dbg !41, !tbaa !16
  call void @enable_isr(i32 2), !dbg !42
  ret void, !dbg !43
}

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_020_001_isr_2() #0 !dbg !44 {
  %1 = load volatile i32, i32* @svp_simple_020_001_global_flag, align 4, !dbg !45, !tbaa !16
  %2 = icmp eq i32 %1, 1, !dbg !46
  br i1 %2, label %3, label %4, !dbg !45

3:                                                ; preds = %0
  store volatile i32 11, i32* @svp_simple_020_001_global_para, align 4, !dbg !47, !tbaa !16
  store volatile i32 5, i32* @svp_simple_020_001_global_var, align 4, !dbg !48, !tbaa !16
  br label %4, !dbg !49

4:                                                ; preds = %3, %0
  ret void, !dbg !50
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_020_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_020")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_020_001_main", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_020_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_020")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 26, column: 3, scope: !7)
!11 = !DILocation(line: 27, column: 3, scope: !7)
!12 = !DILocation(line: 28, column: 3, scope: !7)
!13 = !DILocation(line: 29, column: 3, scope: !7)
!14 = !DILocation(line: 30, column: 35, scope: !7)
!15 = !DILocation(line: 30, column: 33, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 31, column: 35, scope: !7)
!21 = !DILocation(line: 31, column: 33, scope: !7)
!22 = !DILocation(line: 36, column: 7, scope: !7)
!23 = !DILocation(line: 36, column: 39, scope: !7)
!24 = !DILocation(line: 36, column: 37, scope: !7)
!25 = !DILocation(line: 36, column: 71, scope: !7)
!26 = !DILocation(line: 36, column: 69, scope: !7)
!27 = !DILocation(line: 37, column: 15, scope: !7)
!28 = !DILocation(line: 37, column: 13, scope: !7)
!29 = !DILocation(line: 37, column: 5, scope: !7)
!30 = !DILocation(line: 39, column: 7, scope: !7)
!31 = !DILocation(line: 39, column: 39, scope: !7)
!32 = !DILocation(line: 39, column: 37, scope: !7)
!33 = !DILocation(line: 39, column: 71, scope: !7)
!34 = !DILocation(line: 39, column: 69, scope: !7)
!35 = !DILocation(line: 40, column: 15, scope: !7)
!36 = !DILocation(line: 40, column: 13, scope: !7)
!37 = !DILocation(line: 40, column: 5, scope: !7)
!38 = !DILocation(line: 41, column: 1, scope: !7)
!39 = distinct !DISubprogram(name: "svp_simple_020_001_isr_1", scope: !8, file: !8, line: 43, type: !9, scopeLine: 43, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 44, column: 33, scope: !39)
!41 = !DILocation(line: 46, column: 34, scope: !39)
!42 = !DILocation(line: 47, column: 3, scope: !39)
!43 = !DILocation(line: 48, column: 1, scope: !39)
!44 = distinct !DISubprogram(name: "svp_simple_020_001_isr_2", scope: !8, file: !8, line: 50, type: !9, scopeLine: 50, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 51, column: 7, scope: !44)
!46 = !DILocation(line: 51, column: 38, scope: !44)
!47 = !DILocation(line: 52, column: 36, scope: !44)
!48 = !DILocation(line: 53, column: 35, scope: !44)
!49 = !DILocation(line: 54, column: 3, scope: !44)
!50 = !DILocation(line: 55, column: 1, scope: !44)
